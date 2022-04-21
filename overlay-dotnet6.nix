self: super:
{
  dotnet-sdk = super.dotnet-sdk.overrideAttrs (old: rec {
    version = "6.0.200";
    pname = "dotnet-sdk";

    src = super.fetchurl {
      url = "https://dotnetcli.azureedge.net/dotnet/Sdk/${version}/${pname}-${version}-osx-x64.tar.gz";
      sha512 = "2f1ppjs18vwdw17r6b2ihjdbfdpnkimvxajv2l2hnf6r2a8dw9sfznklgrfc3d6g4lddxh6vffaqajcaps6lm4ckdzwlqbzfni8b3qa";
    };
  });
}
