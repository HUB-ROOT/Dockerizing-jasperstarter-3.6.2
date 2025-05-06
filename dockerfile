# Use official OpenJDK 8 slim image
FROM openjdk:8-jre-slim
 
# Install wget and unzip tool
RUN apt-get update && \
    apt-get install -y wget unzip && \
    apt-get clean

# Download jasperstarter
RUN wget https://sourceforge.net/projects/jasperstarter/files/JasperStarter-3.6/jasperstarter-3.6.2-bin.zip/download -O /tmp/jasperstarter-3.6.2-bin.zip

# Set working directory
WORKDIR /opt

# Unzip jasperstarter
RUN unzip /tmp/jasperstarter-3.6.2-bin.zip -d /opt/jasperstarter && \
    rm /tmp/jasperstarter-3.6.2-bin.zip

# Set environment variables
ENV JASPERSTARTER_HOME=/opt/jasperstarter
ENV PATH=$PATH:$JASPERSTARTER_HOME/bin

# Default command
CMD ["jasperstarter", "--version"]

