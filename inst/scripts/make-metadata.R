# Script to generate metadata for methylTFRAnnotationMm10
# Run this from the root of your package directory

meta <- data.frame(
    Title = c(
        "altius_motif_gcfreq.rds",
        "altius_tf_bindsites.rds",
        "cisbpv2_motif_gcfreq.rds",
        "cisbpv2_tf_bindsites.rds",
        "genomewide_GC_mm10.rds",
        "jaspar2020_motif_gcfreq.rds",
        "jaspar2020_tf_bindsites.rds"
    ),
    Description = c(
        "GC bin frequency tables for ALTIUS motifs on mm10. One five-row matrix per motif giving the number of binding sites falling in each genome-wide GC quintile, used by methylTFR to compute the expected methylation a motif would show from GC content alone.",
        "Genome-wide ALTIUS transcription factor binding site predictions for mm10, one GRanges per motif, each range extended by 200 bases on either side of the motif match so that methylTFR can read methylation across the footprint window.",
        "GC bin frequency tables for CISBPV2 motifs on mm10. One five-row matrix per motif giving the number of binding sites falling in each genome-wide GC quintile, used by methylTFR to compute the expected methylation a motif would show from GC content alone.",
        "Genome-wide CISBPV2 transcription factor binding site predictions for mm10, one GRanges per motif, each range extended by 200 bases on either side of the motif match so that methylTFR can read methylation across the footprint window.",
        "Genome-wide GC content distribution for mm10. A GRanges of tiled windows carrying GC_bias and a GC_bin assignment into genome-wide quintiles. methylTFR uses it to assign each methylation call to a GC bin.",
        "GC bin frequency tables for JASPAR2020 motifs on mm10. One five-row matrix per motif giving the number of binding sites falling in each genome-wide GC quintile, used by methylTFR to compute the expected methylation a motif would show from GC content alone.",
        "Genome-wide JASPAR2020 transcription factor binding site predictions for mm10, one GRanges per motif, each range extended by 200 bases on either side of the motif match so that methylTFR can read methylation across the footprint window."
    ),
    BiocVersion = "3.23",
    Genome = "mm10",
    SourceType = "RDS",
    SourceUrl = c(
        "https://resources.altius.org/~jvierstra/projects/motif-clustering/releases/v1.0/",
        "https://resources.altius.org/~jvierstra/projects/motif-clustering/releases/v1.0/",
        "https://github.com/GreenleafLab/chromVARmotifs",
        "https://github.com/GreenleafLab/chromVARmotifs",
        "https://bioconductor.org/packages/BSgenome.Mmusculus.UCSC.mm10/",
        "https://jaspar.elixir.no/",
        "https://jaspar.elixir.no/"
    ),
    SourceVersion = c(
        "Vierstra motif archetypes v1.0",
        "Vierstra motif archetypes v1.0",
        "CIS-BP v2 (chromVARmotifs pwms_v2)",
        "CIS-BP v2 (chromVARmotifs pwms_v2)",
        "mm10",
        "JASPAR2020 CORE",
        "JASPAR2020 CORE"
    ),
    Species = "Mus musculus",
    TaxonomyId = 10090,
    Coordinate_1_based = TRUE,
    DataProvider = c(
        "Altius Institute",
        "Altius Institute",
        "CIS-BP",
        "CIS-BP",
        "UCSC",
        "JASPAR",
        "JASPAR"
    ),
    Maintainer = "Irem B. Gunduz <irembgunduz@gmail.com>",
    RDataClass = c("list", "GRangesList", "list", "GRangesList", "GRanges", "list", "GRangesList"),
    DispatchClass = "Rds",
    Location_Prefix = "https://bioconductorhubs.blob.core.windows.net/annotationhub/",
    RDataPath = c(
        "methylTFRAnnotationMm10/altius_motif_gcfreq.rds",
        "methylTFRAnnotationMm10/altius_tf_bindsites.rds",
        "methylTFRAnnotationMm10/cisbpv2_motif_gcfreq.rds",
        "methylTFRAnnotationMm10/cisbpv2_tf_bindsites.rds",
        "methylTFRAnnotationMm10/genomewide_GC_mm10.rds",
        "methylTFRAnnotationMm10/jaspar2020_motif_gcfreq.rds",
        "methylTFRAnnotationMm10/jaspar2020_tf_bindsites.rds"
    ),
    Tags = c(
        "methylTFRAnnotationMm10:GCcontent:MotifAnnotation:ALTIUS",
        "methylTFRAnnotationMm10:TFBS:MotifAnnotation:ALTIUS",
        "methylTFRAnnotationMm10:GCcontent:MotifAnnotation:CISBPV2",
        "methylTFRAnnotationMm10:TFBS:MotifAnnotation:CISBPV2",
        "methylTFRAnnotationMm10:GCcontent:Genome",
        "methylTFRAnnotationMm10:GCcontent:MotifAnnotation:JASPAR2020",
        "methylTFRAnnotationMm10:TFBS:MotifAnnotation:JASPAR2020"
    )
)

# Write out to inst/extdata/metadata.csv
dir.create("inst/extdata", showWarnings = FALSE, recursive = TRUE)
write.csv(meta, file = "inst/extdata/metadata.csv", row.names = FALSE)

# Validate using AnnotationHubData
if (!requireNamespace("AnnotationHubData", quietly = TRUE)) {
    message("Please install AnnotationHubData to validate your metadata.csv")
} else {
    AnnotationHubData::makeAnnotationHubMetadata("inst/extdata")
    message("Metadata validation completed successfully!")
}