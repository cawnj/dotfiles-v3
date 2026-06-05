# Combined .NET host: SDK 10 + ASP.NET Core 8 runtime under one `dotnet`.
# Build with 10; run/test net8.0 and net10.0 faithfully.
{ dotnetCorePackages }:

dotnetCorePackages.combinePackages [
  dotnetCorePackages.sdk_10_0
  dotnetCorePackages.aspnetcore_8_0
]
