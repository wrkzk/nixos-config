self: super:
{
  multimc = super.multimc.overrideAttrs (old: {
    src = super.fetchFromGitHub {
      owner = "AfoninZ";
      repo = "MultiMC5-Cracked";
      rev = "4afe2466fd5639bf8a03bfb866c070e705420d86";
      sha256 = "1j3i533yxqq8drmk4awmgis9gbkzm6my7ld6vd435yc8vwhzp4jw";
    };
  });
}
