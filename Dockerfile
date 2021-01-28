FROM python:3.7-stretch
COPY . /tmp/scripts
RUN /tmp/scripts/install-julia

RUN pip install --no-cache-dir -r /tmp/scripts/requirements.txt
RUN useradd -m -s /bin/bash julia
USER julia

ENV PYTHON /usr/local/bin/python
RUN julia --color=yes /tmp/scripts/install.jl
WORKDIR /home/julia/notebooks
CMD ["jupyter", "notebook","--ip='*'","--no-browser",  "--NotebookApp.password=''","--NotebookApp.token=''"]
