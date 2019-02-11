# Monitoring Setup

## Instructions
1. Update the value of `adminPassword` in the file `grafana-values.yaml`
1. Run: `./setup_monitoring.sh`
1. After prometheus and grafana have been installed, navigate to the exposed endpoint for grafana 
1. Create a new dashboard using the "import" method. Use [this](https://grafana.com/dashboards/6781) dashboard by entering `6781` in the "Grafana.com Dashboard" text box and click "Load". 
1. For `prometheus`, select "Prometheus". Leave default values for all other fields. Click "Import". 
1. You should now see the dashboard. 
