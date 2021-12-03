# this will start a GUI interface
WIDOCO_OPTIONS=-getOntologyMetadata -rewriteAll -htaccess -webVowl -includeAnnotationProperties -excludeIntroduction -uniteSections #-excludeReference

all:run-sub-aimodel run-sub-core run-sub-gpu run-sub-performance run-sub-program run-allInOne

run-sub-aimodel: 
	java -jar third-party-tools/widoco-1.4.15-jar-with-dependencies.jar ${WIDOCO_OPTIONS} -ontFile development/aimodel/ai-models.ttl -outFolder release/aimodel
run-sub-core: 
	java -jar third-party-tools/widoco-1.4.15-jar-with-dependencies.jar ${WIDOCO_OPTIONS} -ontFile development/core/core.ttl -outFolder release/core

run-sub-gpu: 
	java -jar third-party-tools/widoco-1.4.15-jar-with-dependencies.jar ${WIDOCO_OPTIONS} -ontFile development/gpu/gpu.ttl -outFolder release/gpu
run-sub-performance: 
	java -jar third-party-tools/widoco-1.4.15-jar-with-dependencies.jar ${WIDOCO_OPTIONS} -ontFile development/performance/performance.ttl -outFolder release/performance

run-sub-program: 
	java -jar third-party-tools/widoco-1.4.15-jar-with-dependencies.jar ${WIDOCO_OPTIONS} -ontFile development/program/program.ttl -outFolder release/program
development/hpc-ontology.ttl:development/core/core.ttl development/aimodel/ai-models.ttl development/gpu/gpu.ttl development/performance/performance.ttl development/program/program.ttl
	cat $^ > %@
run-allInOne:development/hpc-ontology.ttl
	java -jar third-party-tools/widoco-1.4.15-jar-with-dependencies.jar ${WIDOCO_OPTIONS} -ontFile development/hpc-ontology.ttl -outFolder release

widoco:
	java -jar third-party-tools/widoco-1.4.15-jar-with-dependencies.jar 
# this will generate files under release folder
test:
	java -jar third-party-tools/vocabLite-1.0.2-jar-with-dependencies.jar -i development -o release -n HPC-Ontology
le:
	java -jar third-party-tools/vocabLite-1.0.2-jar-with-dependencies.jar -i linkedEarch/ontology_development -o linkedEarch/test_release -n "Linked Earth Ontology" 
