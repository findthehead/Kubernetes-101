FROM python:3.11.6
WORKDIR /code
COPY requirements.txt .
ENV PYTHONUNBUFFERED=1
RUN pip install -r requirements.txt
COPY app.py .
EXPOSE 5000
CMD [ "python", "./app.py" ]