const path = require("path");
const exec = require("child_process").exec;

module.exports = function (vorpal) {
  vorpal
    .command('set dns <ip> <interface>')
    .description('Set the DNS of an interface')
    .action(function (args, callback) {
      const interfaceName = args.interface
      const ip = args.ip
      const script = path.join(__dirname, "set_dns.ps1");
      const commandLine = `powershell.exe -Command "${script} -ip ${ip} -interface '${interfaceName}'"`;
      this.log("Executing " + commandLine);

      exec(commandLine, (err, stdout, stderr) => {
          if (stdout) this.log(stdout);
          if (stderr) this.log(stderr);
          if (err) this.log(err);
        })
        .stdin.end();

      callback()
    })
}