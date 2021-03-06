library(devtools)
install_github("xtmwang/PalmTreePlot")
qColors <- c(grDevices::rgb(91, 155, 213, 255, max = 255), # blue
             grDevices::rgb(237, 125, 49, 255, max = 255), # orange
             grDevices::rgb(165, 165, 165, 255, max = 255), # grey
             grDevices::rgb(30, 192, 0, 255, max = 255), # yelow
             grDevices::rgb(68, 114, 196, 255, max = 255), # darker blue
             grDevices::rgb(112, 173, 71, 255, max = 255), # green
             grDevices::rgb(37, 94, 145, 255, max = 255), # even darker blue
             grDevices::rgb(158, 72, 14, 255, max = 255), # blood
             grDevices::rgb(99, 99, 99, 255, max = 255), # dark grey
             grDevices::rgb(153, 115, 0, 255, max = 255), # brown
             grDevices::rgb(38, 68, 120, 255, max = 255), # very dark blue
             grDevices::rgb(67, 104, 43, 255, max = 255), # darker green
             grDevices::rgb(255, 255, 255, 255, max = 255), # black
             grDevices::rgb(255, 35, 35, 255, max = 255)) # red
colorVec = substring(qColors,1,7)

CSDperceptions <- matrix(c(0.3004, 0.6864, 0.4975, 0.2908, 0.2781, 0.2642, 0.1916, 0.284, 0.3514, 0.2534, 0.2089,
                           c( 0.0198, 0.4604, 0.2151, 0.5235, 0.1151, 0.12, 0.5457, 0.3041, 0.06312, 0.384, 0.06064),
                           c( 0.01114, 0.4111, 0.1904, 0.4494, 0.06931, 0.1112, 0.4716, 0.2859, 0.0495, 0.3296, 0.03837),
                           c( 0.01114, 0.2373, 0.089, 0.2707, 0.05322, 0.06436, 0.2756, 0.1656, 0.02967, 0.1916, 0.02228),
                           c( 0.0198, 0.177, 0.07054, 0.0297, 0.0396, 0.02719, 0.0136, 0.02847, 0.0198, 0.02847, 0.02472),
                           c( 0.4543, 0.1275, 0.07673, 0.02847, 0.07293, 0.1077, 0.01609, 0.05198, 0.321, 0.01856, 0.0297),
                           c( 0.06807, 0.1089, 0.06064, 0.0198, 0.1174, 0.04084, 0.01609, 0.01733, 0.03465, 0.01361, 0.03589),
                           c( 0.08168, 0.224, 0.1015, 0.04579, 0.04815, 0.04084, 0.03094, 0.05562, 0.05322, 0.04084, 0.02847)),nrow=8,byrow=TRUE,
                         dimnames=list(Brand=c('Coke','V',"Red Bull","Lift Plus",'Diet Coke','Fanta','Lift','Pepsi'),
                                       Attribute=c('Kids', 'Teens', "Enjoy life", 'Picks you up', 'Refreshes', 'Cheers you up', 'Energy', 'Up-to-date', 'Fun', 'When tired', 'Relax')))

set.seed(123)
weights = rep(1,ncol(CSDperceptions))

prefix = ""
suffix = "%"

# plot mode 1: sums as heights
rhtmlPalmTrees::PalmTrees(data = CSDperceptions,
                           weights = weights,
                           row.names = rownames(CSDperceptions),
                           row.heading = "",
                           col.names = colnames(CSDperceptions),
                           col.heading = "",
                           prefix = prefix,
                           suffix = suffix,
                           tooltips = TRUE,
                           colors = colorVec)


# plot mode 2: constant heights
rhtmlPalmTrees::PalmTrees(data = CSDperceptions,
                           weights = weights,
                           row.names = rownames(CSDperceptions),
                           row.heading = names(dimnames(CSDperceptions))[1],
                           col.names = colnames(CSDperceptions),
                           col.heading = names(dimnames(CSDperceptions))[2],
                           y.lab = "Market share",
                           prefix = prefix,
                           suffix = suffix,
                           y.prefix = "",
                           y.suffix = "%",
                           tooltips = TRUE,
                           colors = colorVec,
                           column.as.heights = 1)
