{ stdenv
, lib
, fetchFromGitHub
, cpp-utilities
, qttools
, qtbase
, cmake
}:

stdenv.mkDerivation rec {
  pname = "qtutilities";
  version = "6.11.0";

  src = fetchFromGitHub {
    owner = "Martchus";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-eMQyXxBupqcLmNtAcVBgTWtAtuyRlWB9GKNpomM10B0=";
  };

  buildInputs = [ qtbase cpp-utilities ];
  nativeBuildInputs = [ cmake qttools ];

  dontWrapQtApps = true;

  meta = with lib; {
    homepage = "https://github.com/Martchus/qtutilities";
    description = "Common Qt related C++ classes and routines used by @Martchus' applications such as dialogs, widgets and models Topics";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ doronbehar ];
    platforms   = platforms.linux;
  };
}
