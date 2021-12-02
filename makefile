# this will start a GUI interface
widoco:
	java -jar third-party-tools/widoco-1.4.15-jar-with-dependencies.jar 
# this will generate files under release folder
test:
	java -jar third-party-tools/vocabLite-1.0.2-jar-with-dependencies.jar -i development -o release -n HPC-Ontology
le:
	java -jar third-party-tools/vocabLite-1.0.2-jar-with-dependencies.jar -i linkedEarch/ontology_development -o linkedEarch/test_release -n "Linked Earth Ontology" 
