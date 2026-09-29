# methylTFRAnnotationMm10 0.99.10

Changes in response to the Bioconductor review:

* `Authors@R` lists the funders (ERA-NET Transcan-Neu III - EPILUNAR,
  grant 01KT2409; Saarland University NanoBioMed Young Investigator
  Grant) with the `fnd` role.

* New package help page `?methylTFRAnnotationMm10` summarising the resources and
  linking the accessors.

* New help pages describing the structure of each AnnotationHub resource
  listed in `inst/extdata/metadata.csv`: `?motif_gcfreq`
  (`?altius_motif_gcfreq`, ...), `?tf_bindsites`
  (`?altius_tf_bindsites`, ...) and `?genomewide_GC`
  (`?genomewide_GC_mm10`).

* New exported `availableMotifSets()` listing the accepted motif sets.

* `getGenomeGC()` accepts `"mm10"` (or no argument) and gives an
  informative error for any other assembly.

* biocViews: `Mus_musculus` instead of `Homo_sapiens`.

* Unit tests now cover the local-directory and AnnotationHub code paths
  (the hub is mocked, so the tests run offline).

* The vignette no longer hides code: the synthetic example data are
  built in a visible chunk, every chunk is evaluated, and each accessor's
  output is printed and explained.

# methylTFRAnnotationMm10 0.99.9

* Initial submission to Bioconductor.

* Provides transcription factor binding sites, motif GC frequency
  tables and a genome-wide GC distribution for mm10, for the
  jaspar2020, cisbpv2 and altius motif sets.

* Resources are hosted on AnnotationHub and downloaded on first use.

* The genome-wide GC table uses non-overlapping 30 nt windows binned
  into five genome-wide GC quintiles. Bin boundaries are recorded with
  the object so that the motif frequency tables and the genome table
  are always binned on the same scale.

* Fixes on NOTES from biocchecks

* Added 4 spaces as suggested
