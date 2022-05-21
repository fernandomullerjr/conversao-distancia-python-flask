# conversao-distancia
Questao 3 do Desafio Docker - Curso KubeDev - Aplicação escrita em NodeJS


# ########################################################################################################################################
# Aplicação escrita em Python utilizando Flask

- Para criação da imagem Docker foram usadas algumas boas práticas aprendidas no curso até o momento, como:

* Nomear a imagem Docker
* Evitar usar imagens não-oficiais de origem duvidosa
* Sempre especificar a tag nas imagens
* Um processo por Container
* Aproveitamento das camadas de imagem

- A versão final do Dockerfile ficou assim:

~~~Dockerfile
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
~~~


- Como o Python Flask tem por default a porta 5000, foi necessário buildar a imagem com aquele parametro host, normalmente, mas ao lançar o Container é necessário mapear a porta externa desejada(8080, 80, etc), para a porta 5000 do Container, pois a porta default do Python Flask não foi alterada.

- Comando para executar o Container:
docker container run -p 8080:5000 -d fernandomj90/desafio-docker-questao3-python-flask:v2

- Além das boas práticas mencionadas, procurei usar a imagem do Node Alpine, que é mais leve.