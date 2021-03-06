{ config, pkgs, ... }:

 {
  
      systemd.timers.prometheus-textfiles-exporters = {
      wantedBy = [ "timers.target" ]; 
      partOf = [ "prometheus-textfiles-exporters.service" ];
      timerConfig.OnCalendar = "minutely";
 };
      systemd.services.prometheus-textfiles-exporters = {
      after = [ "network.target" ];
      description = "prometheus-textfiles-exporters";
      serviceConfig = {
        Type = "simple";
        User = "<USER>";
	Group = "<GRUOP>";
        ExecStart = ''/home/<user>/.local/bin/prom_textfiles_exporters.sh'';
        

     };
  };

}

