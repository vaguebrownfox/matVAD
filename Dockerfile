FROM matlab/asquire:addond2

COPY --chown=root:root license.lic /

COPY --chown=matlab:matlab ./ /home/matlab/Documents/MATLAB/matVad/src/

WORKDIR /home/matlab/Documents/MATLAB/matVad/src/

CMD ["matlab","-batch","script"]