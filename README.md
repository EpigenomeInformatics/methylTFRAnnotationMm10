# methylTFRAnnotationMm10
<!-- badges: start -->
[![Test R-universe](https://github.com/EpigenomeInformatics/methylTFRAnnotationMm10/actions/workflows/r-universe.yml/badge.svg)](https://github.com/EpigenomeInformatics/methylTFRAnnotationMm10/actions/workflows/r-universe.yml)
[![GitHub issues](https://img.shields.io/github/issues/EpigenomeInformatics/methylTFRAnnotationMm10)](https://github.com/EpigenomeInformatics/methylTFRAnnotationMm10/issues)
[![GitHub pulls](https://img.shields.io/github/issues-pr/EpigenomeInformatics/methylTFRAnnotationMm10)](https://github.com/EpigenomeInformatics/methylTFRAnnotationMm10/pulls)
<!-- badges: end -->

`methylTFRAnnotationMm10` provides the genome annotations `methylTFR` needs to compute bias-corrected transcription factor deviation scores on Mm10. 

The package supplies three main resources:
*   **Binding sites**: One `GRanges` object per motif, with each range extended so that methylation can be read across the footprint window.
*   **Motif GC frequency tables**: Tables recording how each motif's binding sites distribute across genome-wide GC quintiles.
*   **Genome-wide GC distribution**: Data that assigns each methylation call to a GC bin.

Because the data are too large to ship inside the package, they are hosted on `AnnotationHub`. The data are downloaded dynamically on first use, and subsequent calls are served seamlessly from the local `AnnotationHub` cache.

## Installation

```R
if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
}
BiocManager::install(c("AnnotationHub","GenomicRanges", "methylTFRAnnotationMm10"))
```

## Usage

You do not need to interact with `AnnotationHub` directly; the package's accessors handle resolution automatically. The retrieved objects are passed directly to `methylTFR::run_methyltfr()`.

```R
library(methylTFRAnnotationMm10)

tf_bindsites <- getTFbindsites("altius")
gcfreqs      <- getGCfreq("altius")
gc_dist      <- getGenomeGC()
```

### Available Motif Sets

The currently supported motif sets are: `altius`, `cisbpv2` and, `jaspar2020`.

## Local Directory Usage

By default, the accessors will query `AnnotationHub` for the required files. However, if you have downloaded the `.rds` files manually or need to run tests in an environment without internet access, you can bypass the hub. 

To read resources from a local directory instead of `AnnotationHub`, configure the local path using either an R option or an environment variable:
*   **Option**: `options(methylTFRAnnotationMm10.datadir = "/path/to/data")`
*   **Environment Variable**: `Sys.setenv(METHYL_TFRANNOTATION_Mm10_DIR = "/path/to/data")`