echo '[
 {
   "eventType": "dataMario",
   "name": "Mario",
   "favouriteColor": "red",
   "favouriteNumber": 64
 }
]' | gzip | curl -v POST -H "Content-Type: application/json" \
-H "Api-Key: <ingest_license_key>" -H "Content-Encoding: gzip" \
https://insights-collector.newrelic.com/v1/accounts/<account_id>/events --data-binary @- 
