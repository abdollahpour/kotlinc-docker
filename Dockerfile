FROM openjdk:14
MAINTAINER Hamed Abdollahpour <hamed@abdollahpour.com>
RUN yum -y install unzip && yum clean all
RUN curl -L https://github.com/JetBrains/kotlin/releases/download/v1.3.72/kotlin-compiler-1.3.72.zip > kotlin.zip && \
  unzip kotlin.zip && \
  rm kotlin.zip
ENV PATH="/kotlinc/bin:${PATH}"

