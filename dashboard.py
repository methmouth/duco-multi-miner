import requests, time, os
W = "46vggUTyU71TS5bDKZ8GpMFbpWaw16Uv2b3ZjXewXiv98GPLuWjVBf7L2sXHMm1FRpgePGkizEmG4R8SgquBLa4HVPSL4d1"
def run():
    while True:
        try:
            d = requests.get(f"https://api.hashvault.pro/v3/monero/address/{W}/workers").json()
            os.system('cls||clear')
            print(f"--- GRANJA METHMOUTH ---")
            for w in d.get('children', []):
                print(f"{w['name']}: {w['hashrate']} H/s")
        except: pass
        time.sleep(30)
if __name__ == "__main__": run()
