\name{enaAscendency}
\alias{enaAscendency}
\title{
Calculates the ascendency of an ecological network.
}
\description{
  Calculates the average mutual information (AMI),
  ascendency, overhead, and capacity of input-output networks.  It also
  returns the ratios of ascendency and overhead to capacity. These metrics
  describe the organization of flow in an ecological network (Ulanowicz
  1997).
}

\usage{
enaAscendency(x = "network object")
}

\arguments{

\item{x}{A network object.}

}


\value{
\item{AMI}{Returns the Average Mutual Information (AMI) in a
  network. AMI provides a measure of the constraints placed on a given
  peice of energy matter moving through a network (Patricio et al. 2006)  }
\item{ASC}{Returns the ascendnecy of a network.  Ascendency is a scaled
  form of AMI relative to the total system throughput (Ulanowicz 1997; 2004).
  Total system throughput is the sum of all activity in a network (Kay et al. 1989).}
\item{OH}{Returns the overhead of a network.  Overhead is the proportion
  of the capacity in a network that is not used as ascendency (Ulanowicz 2004).}
\item{CAP}{Returns the capacity of a network.  Capacity is defined as
  the sum of ascendency and overhead (Ulanowicz 2004).}
\item{ACS.CAP}{Returns the proportion of capacity used by ascendency.}
\item{OH.CAP}{Returns the proportion of capacity used by overhead.}
}

\references{
Kay, J.J., Graham, L.A., Ulanowicz, R.E., 1989. A detailed guide to
network analysis. p. 15-61 In: Wulff, F., Field, J.G., Man, K.H. (eds.)
Network analysis in marine ecology. Coastal Estuarine Study
Serries. Springer-Verlag, Berlin. 

Patrico, J., Ulanowicz, R.E., Pardal, M.A., Marques
J.C., 2004. Ascendency as an ecological indicator: a case study of
estuarine pulse eutrophication. Estuar. Coast Shelf S. 60, 23-35. 

Ulanowicz, R.E., 1997. Ecology, The Ascendent Perspective. Columbia
University Press, New York.

Ulanowicz, R.E., 2004. Quantitative methods for ecological network
analysis. Comput. Biol. Chem. 28, 321-339

}
\author{
  David E. Hines (deh9951@uncw.edu)
  Matthew K. Lau (mkl48@nau.edu)
}

\note{This and other Ulanowicz school functions require that export and
  respiration components of output be separately quantified.}

\seealso{
   \code{\link{read.scor},\link{read.wand},\link{enaStorage},\link{enaUtility}}
}

\examples{
data(troModels)
enaAscendency(troModels[[6]])
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
% \keyword{ Ascendency }
% \keyword{ Overhead }
% \keyword{ Capacity }