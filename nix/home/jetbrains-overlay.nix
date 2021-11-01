self: super:
{
  jetbrians.rider = super.jetbrians.rider.overrideAttrs (old: rec {
    version = "2021.2.2";
    name = "rider-${version}";
    src = super.fetchurl {
      url = "https://download.jetbrains.com/rider/JetBrains.Rider-${version}.tar.gz";
      sha256 = "ca61667359c841b01b2b257df476b97cfcce8c423e6a0a32c5b1e4367e45bd9f";
    };
  });
}
