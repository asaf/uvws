from core import __version__ as core_version
from svc1.main import __version__ as svc1_version
from svc1.main import read_root

__version__ = "0.0.4"


def main() -> None:
    a = read_root()
    print(a)
    print("Hello from uvws!!", "svc1 ver", svc1_version, "core ver", core_version)
