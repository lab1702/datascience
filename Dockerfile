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
    libavfilter-dev \
    jupyter \
    python3-pip \
    python3-venv

RUN apt-get clean -y


RUN /usr/local/lib/R/site-library/littler/examples/update.r -n -1

RUN install2.r -e -s -n -1 \
    reticulate \
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
    treeheatr \
    dataMaid \
    xray \
    visdat \
    dlookr \
    funModeling \
    arsenal \
    SmartEDA \
    summarytools \
    exploreR \
    autoplotly \
    gpairs \
    DALEX \
    DALEXtra \
    modelStudio \
    ppsr \
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
    shinymanager \
    profvis \
    ggthemes \
    hrbrthemes \
    ggdark \
    basetheme \
    prettydoc \
    rticles \
    distill \
    alluvial \
    ggalluvial \
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
    quanteda \
    quanteda.textstats \
    quanteda.textplots \
    quanteda.textmodels \
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
    magick \
    rayshader \
    rayrender \
    rayimage \
    av \
    choroplethr \
    choroplethrAdmin1 \
    choroplethrMaps


RUN su -l rstudio -c "R -e 'IRkernel::installspec()'"


COPY jupyter.sh /etc/services.d/jupyter/run
RUN dos2unix /etc/services.d/jupyter/run
RUN chmod a+rx /etc/services.d/jupyter/run


COPY rstudio-prefs.json /home/rstudio/.config/rstudio/rstudio-prefs.json
RUN dos2unix /home/rstudio/.config/rstudio/rstudio-prefs.json
RUN rm -rf /home/rstudio/.rstudio


RUN chown -R rstudio:rstudio /home/rstudio
