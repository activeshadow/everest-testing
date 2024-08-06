export LD_LIBRARY_PATH=/opt/everest-core/build/dist/lib:$LD_LIBRARY_PATH
export PATH=/opt/everest-core/build/dist/bin:$PATH

manager --prefix /opt/everest-core/build/dist \
	--conf /etc/everest/${1}.yaml
