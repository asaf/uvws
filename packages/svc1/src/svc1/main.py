import os
import sysconfig
from typing import Any

import uvicorn
from core import __version__ as core_version
from fastapi import FastAPI, Response
from fastapi.staticfiles import StaticFiles

from svc1 import __version__

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


class SPAStaticFiles(StaticFiles):
    async def get_response(self, path: str, scope: Any) -> Response:
        assert isinstance(self.directory, str), "Static directory must be a string"

        full_path = os.path.join(self.directory, path)

        # If the file exists, serve it
        if os.path.isfile(full_path):
            return await super().get_response(path, scope)

        # If the file does NOT exist, serve `index.html`
        return await super().get_response("index.html", scope)


# static_dir = os.path.join(os.path.dirname(__file__), "../../static/")
# Get the shared data directory where Hatch installed `static/`
shared_data_dir = sysconfig.get_path("data")
static_dir = os.path.join(shared_data_dir, "svc1", "static")
app.mount("/chat", SPAStaticFiles(directory=static_dir), name="static")


def start():
    print("Starting the server : " + __version__ + "with core version: " + core_version)
    uvicorn.run(app, host="0.0.0.0", port=8000)
