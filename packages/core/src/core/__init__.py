__version__ = "0.1.0"


def main() -> None:
    print("Hello from core!")


def hi() -> str:
    return "hi from core package" + __version__
