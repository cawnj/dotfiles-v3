# .NET SDK 10 + ASP.NET Core 8 runtime combined
{ dotnetCorePackages }:

dotnetCorePackages.combinePackages [
  dotnetCorePackages.sdk_10_0
  dotnetCorePackages.aspnetcore_8_0
]
