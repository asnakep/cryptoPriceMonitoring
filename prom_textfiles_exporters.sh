#!/bin/bash

PATH=$PATH


### USD/EUR RATES Metric
curl -s http://www.floatrates.com/daily/usd.json \
| jq '.eur | del(.code, .alphaCode, .name, .date)' \
| tr -d \"{},: | awk NF | sed -e 's/^[ \t]*/usd_eur_rates_/' > /var/lib/prometheus-node-exporter-text-files/usd_eur_rates.prom


### ADA, BTC, ETH, USDT Market Cap
curl -s -X GET "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1" -H "accept: application/json"| jq | grep -A 5 '"id": "bitcoin"' | grep '"market_cap"' | awk '{print $2}' | sed 's/,//' |  awk NF | sed -e 's/^[ \t]*/btc_marketcap /' > /var/lib/prometheus-node-exporter-text-files/btc_marketcap.prom

curl -s -X GET "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1" -H "accept: application/json"| jq | grep -A 5 '"id": "ethereum"' | grep '"market_cap"' | awk '{print $2}' | sed 's/,//' |  awk NF | sed -e 's/^[ \t]*/eth_marketcap /' > /var/lib/prometheus-node-exporter-text-files/eth_marketcap.prom

curl -s -X GET "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1" -H "accept: application/json"| jq | grep -A 5 '"id": "cardano"' | grep '"market_cap"' | awk '{print $2}' | sed 's/,//' |  awk NF | sed -e 's/^[ \t]*/ada_marketcap /' > /var/lib/prometheus-node-exporter-text-files/ada_marketcap.prom

curl -s -X GET "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1" -H "accept: application/json"| jq | grep -A 5 '"id": "tether"' | grep '"market_cap"' | awk '{print $2}' | sed 's/,//' |  awk NF | sed -e 's/^[ \t]*/usdt_marketcap /' > /var/lib/prometheus-node-exporter-text-files/usdt_marketcap.prom


### ADA Price USD
curl -s -X GET "https://api.coingecko.com/api/v3/simple/price?ids=cardano&vs_currencies=usd" -H "accept: application/json" | sed 's/cardano//' | sed 's/usd//' | sed s'/"//g'| sed s'/{//g' | sed s'/}//g' | sed s'/://g' | awk NF | sed -e 's/^[ \t]*/adaprice_usd /' > /var/lib/prometheus-node-exporter-text-files/adaprice_usd.prom

### ADA Price EUR
curl -s -X GET "https://api.coingecko.com/api/v3/simple/price?ids=cardano&vs_currencies=eur" -H "accept: application/json" | sed 's/cardano//' | sed 's/eur//' | sed s'/"//g'| sed s'/{//g' | sed s'/}//g' | sed s'/://g' | awk NF | sed -e 's/^[ \t]*/adaprice_eur /' > /var/lib/prometheus-node-exporter-text-files/adaprice_eur.prom

### BTC Price USD
curl -s -X GET "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd" -H "accept: application/json" | sed 's/bitcoin//' | sed 's/usd//' | sed s'/"//g'| sed s'/{//g' | sed s'/}//g' | sed s'/://g' | awk NF | sed -e 's/^[ \t]*/bitcoinprice_usd /' > /var/lib/prometheus-node-exporter-text-files/bitcoinprice_usd.prom

### BTC Price EUR
curl -s -X GET "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=eur" -H "accept: application/json" | sed 's/bitcoin//' | sed 's/eur//' | sed s'/"//g'| sed s'/{//g' | sed s'/}//g' | sed s'/://g' | awk NF | sed -e 's/^[ \t]*/bitcoinprice_eur /' > /var/lib/prometheus-node-exporter-text-files/bitcoinprice_eur.prom


### Statistics from Adapools.org

### GLOBAL CARDANO Stats
curl -s https://js.adapools.org/global.json \
| jq 'del(.protocol_const, .epoch_started, .last_block_time)' \
| tr -d \"{},: \
| awk NF \
| sed -e 's/^[ \t]*/global_/' > /var/lib/prometheus-node-exporter-text-files/global.prom
