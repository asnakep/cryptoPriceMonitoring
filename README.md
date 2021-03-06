# Grafana Dashboard: ADA and BTC Live Price, Projections, Portfolios, ADA Live Stake
# Requirements: Grafana with 'Separator' panel installed and Prometheus with textfiles collector enabled.
# Content: 
1. prom_textfiles_exporters.sh (script to generate prometheus textfile metrics, it requires curl and jq).
2. dashboard.json (Dashboard to be imported in Grafana).
3. prometheus_textfile_exporters.nix (systemd service with timer (minutely) to run the script prom_textfiles_exporters.sh).
   You should adjust it accordingly to your systemd format or run it with a cronjob.

- Path in script to store the prom files is /var/lib/prometheus-node-exporter-text-files.
- Not all generated metrics are used in this dashboard.

Cheers,
06/02/2021
Manuel of SNAKE Pool.

