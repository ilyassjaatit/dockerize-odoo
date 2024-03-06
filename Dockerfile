FROM python:3.11-bullseye

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# update and upgrade
RUN apt update && apt upgrade -y

# install dependencies that odoo needs to work
RUN apt install build-essential wget -y

RUN apt install libxslt-dev libzip-dev  -y

RUN apt  install libldap2-dev libsasl2-dev  -y

RUN apt install libjpeg-dev   -y

RUN apt install libpq-dev -y
RUN apt install libxml2-dev -y
RUN apt install libxslt1-dev libldap2-dev  -y
RUN apt install libsasl2-dev libffi-dev -y
# To use envsubst
RUN apt install gettext-base -y

# TODO install a specific version of node.js, to have more control
# install node  https://packages.debian.org/bullseye/arm64/nodejs
# npm https://packages.debian.org/bullseye/arm64/npm
RUN apt install nodejs  -y
RUN apt install npm  -y

# PDF
RUN apt install xfonts-75dpi wkhtmltopdf -y


# Install requeriments python for sources code
# TODO create an environment to install the dependencies and run the code
COPY src-odoo/requirements.txt /tmp
RUN pip install -r /tmp/requirements.txt

# To add dependencies and addons from pypi
COPY ./extra_requirements.txt /tmp

# Entrypoint
COPY /compose/entrypoint /entrypoint
# removes carriage returns at the end of each line

RUN sed -i 's/\r$//g' /entrypoint
RUN chmod +x /entrypoint

# Start command
COPY ./compose/start /start
RUN sed -i 's/\r$//g' /start
RUN chmod +x /start

WORKDIR src-odoo
COPY src-odoo .

# We install odoo, it is a dependency of the pypi odoo addons
RUN pip install -e .
# install odoo addons by pypi
RUN pip install -r /tmp/extra_requirements.txt

ENTRYPOINT ["/entrypoint"]