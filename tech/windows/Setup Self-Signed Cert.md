**Acknowledgements: Thanks KJ!**

Requires Windows 8.1 or Windows Server 2012 R2 and higher.

Here is a PowerShell script that will:

1. Generate a new self-signed SSL certificate for "localhost" and the name of your computer.
2. Automatically trust the certificate.
3. Create an IIS Binding for that certificate.

```
  $cert = New-SelfSignedCertificate -DnsName localhost, $env:COMPUTERNAME -CertStoreLocation Cert:\LocalMachine\My
  $rootStore = New-Object System.Security.Cryptography.X509Certificates.X509Store -ArgumentList Root, LocalMachine
  $rootStore.Open("MaxAllowed")
  $rootStore.Add($cert)
  $rootStore.Close()
  New-WebBinding -Name "Default Web Site" -IPAddress "*" -Port 443 -Protocol https
  pushd IIS:\SslBindings
  $cert | New-Item 0.0.0.0!443
  popd
```
