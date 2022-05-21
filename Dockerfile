FROM python:3.6.1-alpine
RUN pip install --upgrade pip
RUN pip install -U pip setuptools wheel
RUN pip install markupsafe
RUN pip install flask
COPY app.py /app.py
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install --no-cache-dir -r /app/requirements.txt
COPY . .
CMD ["python","app.py"]