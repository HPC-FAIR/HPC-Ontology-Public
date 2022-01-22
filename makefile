# this will start a GUI interface
WIDOCO_OPTIONS=-jar third-party-tools/widoco-1.4.15-jar-with-dependencies.jar -getOntologyMetadata -rewriteAll -htaccess -webVowl -includeAnnotationProperties -excludeIntroduction -uniteSections #-excludeReference


# ontology names without directory path
ONTOLOGY_FILES = \
aimodel.ttl \
core.ttl \
gpu.ttl \
performance.ttl \
program.ttl

# Generate web index files like "release/BASENAME/index-en.html"
ONTOLOGY_WEB_INDEX_FILES=$(addprefix release/, $(addsuffix /index-en.html, $(basename ${ONTOLOGY_FILES})))
ONTOLOGY_FILES_With_Path=$(addprefix development/, ${ONTOLOGY_FILES})

testvar:
	echo ${ONTOLOGY_FILES_With_Path}

# convert release web index file to development ttl source file in the dependency
# also convert it to output folder in rules 	
${ONTOLOGY_WEB_INDEX_FILES}:release/%/index-en.html:development/%.ttl
	java ${WIDOCO_OPTIONS} -ontFile $< -outFolder $(@:%/index-en.html=%)
#release/aimodel/index-en.html: development/ai-models.ttl
#	java -jar third-party-tools/widoco-1.4.15-jar-with-dependencies.jar ${WIDOCO_OPTIONS} -ontFile $< -outFolder release/aimodel
#

#development/hpc-ontology.ttl:development/core/core.ttl development/aimodel/ai-models.ttl development/gpu/gpu.ttl development/performance/performance.ttl development/program/program.ttl
development/hpc-ontology.ttl: $(ONTOLOGY_FILES_With_Path)
	cat $^ > $@

release/index-en.html:development/hpc-ontology.ttl
	java ${WIDOCO_OPTIONS} -ontFile $< -outFolder release

all: ${ONTOLOGY_WEB_INDEX_FILES} release/index-en.html

# this will generate files under release folder
clean:
	rm -rf release development/hpc-ontology.ttl
