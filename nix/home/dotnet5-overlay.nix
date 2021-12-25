self: super:
{
  dotnet-sdk_5 = super.dotnet-sdk.overrideAttrs (old: rec {
    version = "5.0.401";
    pname = "dotnet-sdk";

    src = super.fetchurl {
      url = "https://dotnetcli.azureedge.net/dotnet/Sdk/${version}/${pname}-${version}-osx-x64.tar.gz";
      sha512 = "1rdarg3d8nndn0rrcd5v10wy2hw2f46a1pz6v5mgsmafqw6dzx6xmqrij419qyym728drpkl94vg2llzmyc4hfv1zg07pjsi3h946jd";
    };
  });
}
