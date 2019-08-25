FROM rocker/shiny:3.5.1

RUN R -e "install.packages(c('ggplot2'))"

WORKDIR /app/
COPY . .

RUN groupadd -r tam && useradd --no-log-init -r -g tam tam
RUN chown -R tam:tam /app/
USER tam

EXPOSE 8888
CMD ["Rscript","test_run.R"]
#ENTRYPOINT ["Rscript", "test.R"]

