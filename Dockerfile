FROM maven as build
WORKDIR /opt
COPY . . 
RUN mvn clean install 

FROM openjdk
COPY bin/ bin/
COPY certs/ certs/
COPY config/ config/
COPY --from=build /opt/target/*.jar app.jar
RUN chmod +x /bin/start.sh
EXPOSE 8443
CMD ["./bin/start.sh"]
