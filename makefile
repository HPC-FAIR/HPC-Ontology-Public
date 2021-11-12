all:
	java -jar third-party-tools/vocabLite-1.0.2-jar-with-dependencies.jar -i development -o release -n HPC-Ontology
le:
	java -jar third-party-tools/vocabLite-1.0.2-jar-with-dependencies.jar -i linkedEarch/ontology_development -o linkedEarch/test_release -n "Linked Earth Ontology" 
