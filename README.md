# Matrix Sketching over Sliding Windows

## Prerequisites

You will need the following tools installed:

- [Docker](https://docs.docker.com/get-docker/)
- [VS Code](https://code.visualstudio.com/) with [Dev Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Installation & Usage

Under your project folder, pull this git repository:

```bash
git clone https://github.com/kelaendi/sliding-window-sketching.git swfd --depth 1
```

Open the folder in VS Code and choose "Reopen in Container" when prompted
(also searcheable in commad palette with ctrl+shift+P).

Once the container is built, it will automatically:

Install the necessary dependencies.
Download the datasets.
Run the initial setup scripts.

If not using the container

Then you can import it in your project folder:

```python
from swfd import SeqBasedSWFD
from swfd import RobustFrequentDirections
from swfd import FrequentDirectionsWithDump

import numpy as np

if __name__ == "__main__":
    l = 16
    N = 64
    d = 32
    R = 2**16 - 1
    epochs = 2048
    sw_fd = SeqBasedSWFD(N, R, d, l)

    random_vector = np.random.randn(1, d)
    a = np.sqrt(R) * random_vector / np.linalg.norm(random_vector, ord=2)
    sw_fd.fit(a)
    B_t, _, _, delta = sw_fd.get()
    print(B_t)
```

## Run experimental scripts

The filenames of experimental scripts are prefixed with `test_*.py`.