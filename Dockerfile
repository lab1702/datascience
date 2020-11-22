FROM rocker/geospatial
LABEL maintainer="lab1702"


RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y \
    git \
    dos2unix \
    graphviz \
    tdsodbc \
    libmpfr-dev \
    libtbb-dev \
    libgsl-dev \
    jupyter \
    python3-pip \
    python3-virtualenv \
    python3-pandas \
    python3-numpy \
    python3-scipy \
    python3-matplotlib \
    python3-seaborn \
    python3-sklearn \
    python3-statsmodels \
    python3-plotly \
    python3-pymssql \
    python3-pyodbc

RUN apt-get clean -y


RUN /usr/local/lib/R/site-library/littler/examples/update.r -n -1

RUN install2.r -e -s -n -1 \
    IRkernel \
    rsconnect \
    odbc \
    janitor \
    writexl \
    blastula \
    monaco \
    caret \
    DMwR \
    ROSE \
    imbalance \
    caretEnsemble \
    mlr3verse \
    tidymodels \
    modeltime.ensemble \
    randomForest \
    xgboost \
    tensorflow \
    keras \
    C50 \
    e1071 \
    gbm \
    glmnet \
    rpart.plot \
    forecast \
    prophet \
    quantmod \
    tidyquant \
    anomalize \
    changepoint \
    bcp \
    CausalImpact \
    fitdistrplus \
    flexdashboard \
    shinythemes \
    shinycssloaders \
    shinydashboard \
    shinyBS \
    shinyjs \
    profvis \
    ggthemes \
    hrbrthemes \
    ggdark \
    basetheme \
    prettydoc \
    easyalluvial \
    gridExtra \
    latticeExtra \
    kableExtra \
    plotly \
    anytime \
    doMC \
    doParallel \
    doFuture \
    future.apply \
    keyring \
    sjPlot \
    ggstatsplot \
    rgl \
    network \
    igraph \
    stargazer \
    ragg \
    svglite \
    maps \
    mapproj \
    leaflet \
    tidytext \
    topicmodels \
    sentimentr \
    udpipe \
    styler \
    arules \
    arulesCBA \
    arulesNBMiner \
    arulesSequences \
    arulesViz \
    survminer \
    FactoMineR \
    Factoshiny \
    Holidays \
    pacman \
    packrat \
    rjson \
    rhandsontable \
    excelR \
    formattable \
    rpivotTable \
    learnr \
    treeheatr \
    magick \
    rayshader \
    choroplethr \
    choroplethrAdmin1 \
    choroplethrMaps


RUN echo 'Sys.setenv(TZ = "US/Eastern")' > /home/rstudio/.Rprofile


RUN su -l rstudio -c "R -e 'IRkernel::installspec()'"


COPY jupyter.sh /etc/services.d/jupyter/run
RUN dos2unix /etc/services.d/jupyter/run
RUN chmod a+rx /etc/services.d/jupyter/run


COPY rstudio-prefs.json /home/rstudio/.config/rstudio/rstudio-prefs.json
RUN dos2unix /home/rstudio/.config/rstudio/rstudio-prefs.json
RUN rm -rf /home/rstudio/.rstudio


RUN chown -R rstudio:rstudio /home/rstudio
