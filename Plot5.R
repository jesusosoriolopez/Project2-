# Jesus Osorio 
library(ggplot2)

NEI <- readRDS("C:/Users/Jesuso/Documents/UPEMOR_Abril_Mayo_2015_Topicos_Selectos/R_Prog/Project2/summarySCC_PM25.rds")
NEI$year <- factor(NEI$year, levels = c('1999', '2002', '2005', '2008'))
SCC <- readRDS("C:/Users/Jesuso/Documents/UPEMOR_Abril_Mayo_2015_Topicos_Selectos/R_Prog/Project2/Source_Classification_Code.rds")


MD.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')


MD.df <- aggregate(MD.onroad[, 'Emissions'], by = list(MD.onroad$year), sum)
colnames(MD.df) <- c('year', 'Emissions')

png('plot5.png')
ggplot(data = MD.df, aes(x = year, y = Emissions)) + geom_bar(aes(fill = year), stat = "identity") + guides(fill = F) + ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position = 'none') + geom_text(aes(label = round(Emissions, 0), size = 1, hjust = 0.5, vjust = 2))
dev.off()