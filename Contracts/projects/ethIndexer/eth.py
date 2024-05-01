from web3 import Web3
import json
from loguru import logger

class EthIndexer:
    def __init__(self):
        self.mainnet_url = "Place your url here"
        self.HTTPProvider = Web3.HTTPProvider(self.mainnet_url)

    def index(self,block_num):
        w3 = Web3(self.HTTPProvider)
        latest_block_num = w3.eth.get_block_number()
        logger.info(f"latest block number is {latest_block_num}")
        data = []
        for block in range(block_num, latest_block_num):
            logger.info(f"indexing block number is {block}")
            latest_block = w3.eth.get_block(block)

            blockid = latest_block['number']
            time = latest_block['timestamp']
            data = {
                "block_id": blockid,
                "timestamp": time,
                "transactions": []
            }

            for tx in latest_block.transactions:
                tx_hash = tx.hex()
                tx_data = w3.eth.get_transaction(tx_hash)
                tx_receipt = w3.eth.get_transaction_receipt(tx_hash)
                value = tx_data['value']
                input_data = tx_data['input'].hex()  # Convert bytes to hex string
                
                tx_info = {
                    "transaction_hash": tx_hash,
                    "transaction_data": {
                        "from": tx_data['from'],
                        "to": tx_data['to'],
                        "value": value,
                        "gas_used": tx_receipt['gasUsed'],
                        "gas_price": tx_data['gasPrice'],
                        "block_number": blockid,
                        "input_data": input_data,
                    }
                }
                
                # Check if the transaction is a contract transfer
                if value == 0 and input_data.startswith('0xa9059cbb'):
                    contract_to = '0x' + input_data[34:74]  # Extract contract address
                    contract_value = int(input_data[74:], 16)  # Convert value to integer
                    tx_info["transaction_data"]["contract_to"] = contract_to
                    tx_info["transaction_data"]["contract_value"] = contract_value
                    
                    # Check for buggy transactions
                    if len(contract_to) > 42:  # Assuming Ethereum addresses are 42 characters long
                        print(f"Skipping {tx_hash}. Incorrect contract_to length: {len(contract_to)}")
                        continue
                
                data["transactions"].append(tx_info)

        with open(f"transactions{block}.json", "w") as json_file:
            json.dump(data, json_file, indent=4)
        

if __name__ == "__main__":
    ethindex = EthIndexer()
    ethindex.index(19773968)   #enter your block_number
   
