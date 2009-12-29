\name{AhRs}
\alias{AhRs}
\docType{data}
\title{Sample data for partitionMetric}
\description{
This small dataset contains aligned protein sequences for seven alleles of the
aryl hydrocarbon receptor (AhR).
}
\usage{data(AhRs)}
\format{
  The format is a character matrix in which column \eqn{i}{i} represents
  the \eqn{i}{i}'th position in the alignment, and contains an amino
  acid code or "-" indicating an indel.  Row names contain the
  animal species. 
}

\details{ A DNA or protein sequence has an associated index set
  \eqn{\{1,2,\ldots,n\}}{\{1, 2, ..., n\}} that labels the \eqn{n}{n}
  positions of the nucleotides or amino acids (AA).
  This index set can be partitioned such that all members referring to
  the same AA share a homogeneous partition.
  For example, given the sequence \verb{ATGTA} and its index
  set \eqn{\{1,2,\ldots,5\}}{\{1,2,\ldots,5\}}, the "A" partition
  contains the subset \eqn{\{1,5\}}{\{1,5\}}, the "T" partition contains
  \eqn{\{2,4\}}{\{2,4\}}, and so on.

  Given two aligned sequences and their respective partitions of the
  index set, a metric distance between these partitions can be computed.  See
  \code{\link{partitionMetric}} for such a metric, along with an example
  of clustering this AhR dataset.  }

\source{
This dataset was derived from NCBI HomoloGene:1224.
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
Mark Hahn, Aryl hydrocarbon receptors: diversity and evolution. \emph{Chem
Biol Interact}, 2002, \strong{141}, 131-160 
}
\keyword{datasets}
