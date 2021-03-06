{ config, lib, pkgs, ... }:

{
  # Prometheus Exporter
  services.prometheus.enable = true;
  services.prometheus.exporters.node = {
  enable = true;
  enabledCollectors = [ "textfile" "conntrack" "ntp" "diskstats" "entropy" "filefd" "filesystem" "loadavg" "mdadm" "meminfo" "netdev" "netstat" "stat" "time" "vmstat" "systemd" "logind" "interrupts" "ksmd" ];
  extraFlags = [ "--collector.textfile.directory=/var/lib/prometheus-node-exporter-text-files" ];
  openFirewall = true;
  firewallFilter = "-i br0 -p tcp -m tcp --dport 9090";
};

}

