\name{partitionMetric}
\alias{partitionMetric}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Compute a distance metric between two partitions of a set}
\description{
Given a set partitioned in two ways, compute a distance metric between
the partitions.
}
\usage{
partitionMetric(B, C, beta = 2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{B}{
%% ~~Describe \code{B} here~~ 

B and C are vectors that represents partitions of a single set, with
each element representing a member of the set.  \eqn{B_i}{B(i)}
corresponds to \eqn{C_i}{C(i)}, and the two vectors must be the same
length.  The data types of B and C must be identical and convertable to a
factor data type.

See examples below for more information.

} 
\item{C}{See B above.
%%     ~~Describe \code{C} here~~
}
  \item{beta}{
    \eqn{\beta}{Beta} is the nonlinear parameter used to compute the
    distance metric.  See the publication referenced below for full details.
%%     ~~Describe \code{beta} here~~
}
}
\value{
The return value is a nonnegative real number representing the distance
between the two partition of the set.  Full details are in the paper
referenced below.
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
David Weisman and Dan Simovici, 
  Several Remarks on the Metric Space of Genetic Codes.
  	\emph{International
Journal of Data Mining and Bioinformatics}, 2012(6).
}
\author{
David Weisman, Dan Simovici
%%  ~~who you are~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{as.dist}}, \code{\link{hclust}}
}

\examples{
## Define several partitions of a 4-element set
gender <- c('boy',   'girl', 'girl',   'boy')
height <- c('short', 'tall', 'medium', 'tall')
age    <- c(7,       6,      5,        4)    

## Compute some distances
(dGG <- partitionMetric (gender, gender))
(dGH <- partitionMetric (gender, height))
(dHG <- partitionMetric (height, gender))
(dGA <- partitionMetric (gender, age))
(dHA <- partitionMetric (height, age))

## These properties must hold for any metric 
dGG == 0
dGH == dHG
dGA <= dGH + dHA

## Note that the partition names are irrelevant, and only need to be
## self-consistent within each B and C.  It follows that these two set
## partitions are identical and have distance 0.
partitionMetric (c(1,8,8), c(7,3,3)) == 0


## Use the set partition to measure amino acid acid sequence differences
## between several alleles of the aryl hydrocarbon receptor.

data(AhRs)
dim(AhRs)
AhRs[,1:10]

distanceMatrix <-
  matrix(nrow=nrow(AhRs), ncol=nrow(AhRs), 0,
         dimnames=list(rownames(AhRs), rownames(AhRs)))

for (pair in combn(rownames(AhRs), 2, simplify=FALSE)) {
  d <- partitionMetric (AhRs[pair[1],], AhRs[pair[2],], beta=1.01)
  distanceMatrix[pair[1],pair[2]] <- distanceMatrix[pair[2],pair[1]] <- d
}

hc <- hclust(as.dist(distanceMatrix))
plot(hc,
     sub=sprintf('Cophenentic correlation between distances and tree is \%0.2f',
       cor(as.dist(distanceMatrix), cophenetic(hc))))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
