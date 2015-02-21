FROM ubuntu:14.04
ADD get-version /usr/bin/get-version
RUN chmod +x /usr/bin/get-version
ENTRYPOINT ["/usr/bin/get-version"]
CMD ["bash"]
