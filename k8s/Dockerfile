
FROM r-base

MAINTAINER Eli Mayost <eli.mayost@kyndryl.com>

# Update packages
RUN apt-get -y update

# Install needed packages
RUN apt-get install -y libxml2-dev libssl-dev libcurl4-openssl-dev libpq-dev pandoc

RUN apt-get install -y curl 

# Install needed packages
RUN /usr/bin/Rscript -e 'install.packages("data.table"          , repos="https://cloud.r-project.org")'
RUN /usr/bin/Rscript -e 'install.packages("bit64"               , repos="https://cloud.r-project.org")'
RUN /usr/bin/Rscript -e 'install.packages("ggplot2"             , repos="https://cloud.r-project.org")'
RUN /usr/bin/Rscript -e 'install.packages("plotly"              , repos="https://cloud.r-project.org")'
RUN /usr/bin/Rscript -e 'install.packages("rmarkdown"           , repos="https://cloud.r-project.org")'
RUN /usr/bin/Rscript -e 'install.packages("flexdashboard"       , repos="https://cloud.r-project.org")'
RUN /usr/bin/Rscript -e 'install.packages("googleAuthR"         , repos="https://cloud.r-project.org")'
RUN /usr/bin/Rscript -e 'install.packages("googleCloudStorageR" , repos="https://cloud.r-project.org")'

# Working env for CMT
RUN mkdir -p /cmt/jobs/ /cmt/data/ /cmt/utils/ /cmt/report /cmt/keys

WORKDIR .

COPY jobs /cmt/jobs
COPY utils /cmt/utils
COPY report /cmt/report
COPY keys /cmt/keys

