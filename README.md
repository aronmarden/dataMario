## Step 1: Copy an `INGEST - LICENSE` API Key and it's corresponding `Account ID`

To get started, you'll need to obtain an `INGEST - LICENSE` API Key and it's corresponding Account ID from your New Relic account. Follow these steps:

1. Go to the [New Relic API Keys Page](https://one.newrelic.com/admin-portal/api-keys/home). -- It will prompt you to login if you aren't already. 
2. Look for, or create a new, `INGEST - LICENSE` API Key
3. Click the three dots on the far right of the key
4. Copy Key to your editor of choice
5. Return back to the same location you copied your `INGEST - LICENSE` API Key and copy the `Account ID` corresponding to that `INGEST - LICENSE` API Key

## Step 2: Replace `<ingest_license_key>` and `<account_id>` API Key

1. Take your copied values and replace `<ingest_license_key>` and `<account_id>` in either the mac.sh or windows.ps1 examples in this repo

```
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
```

2. Execute your script to send a `dataMario` payload into New Relic

`% sh mac.sh`


## Step 3: Head over to New Relic to see your payload

1. Go to the [Metrics & Events](https://one.newrelic.com/data-explorer?) in New Relic
2. Search for your `eventType` -- in the above example, it would be `dataMario`