#Part I
loadLibrary <- function() {
  library(MASS)
  library(car)
  library(e1071)
  library(class)
  library(gmodels)
  print("MASS")
  print("car")
  print("e1071")
  print("class")
  print("gmodels")
  print("The library have been loaded.")
}
#1
loadLibrary()
#2 single regression
data(UScrime)
head(UScrime)
attach(UScrime)
#2-1 positive correlation
lm.fit1=lm(y~Po1)
lm.fit1
plot(Po1, y, pch = 20, col = "red")
abline(lm.fit1, lwd = 3, col = "blue")
#2-2 negative correlation
lm.fit2=lm(y~Prob)
lm.fit2
plot(Prob, y, pch = 20, col = "red")
abline(lm.fit2, lwd = 3, col = "blue")
#3-1 multiple regression
crime.all <- lm(y~.,UScrime)
crime.all
#3-2
crime5 <- lm(y~NW+Time+M.F+U2+LF,UScrime)
crime5
vif(crime5)
#4
step(crime.all)

detach(UScrime)

#Part II
#0
data(Rabbit)
head(Rabbit)
#1 SVM
x <- subset(Rabbit, select = -Animal)
y <- Rabbit$Animal
svm_model <- svm(Animal~., data = Rabbit)
pred_model <- predict(svm_model, x)
CrossTable(pred_model, y)
#2 KNN
Rabbit$Run = as.integer(as.factor(Rabbit$Run))
Rabbit$Treatment = as.integer(as.factor(Rabbit$Treatment))
ind <- sample(2, nrow(Rabbit), replace=TRUE, prob=c(0.67, 0.33))
ind
Rabbit.training <- Rabbit[ind==1, 1:4]
head(Rabbit.training)
Rabbit.test <- Rabbit[ind==2, 1:4]
head(Rabbit.test)
Rabbit.trainLabels <- Rabbit[ind==1, 5]
print(Rabbit.trainLabels)
Rabbit.testLabels <- Rabbit[ind==2, 5]
print(Rabbit.testLabels)
kv = round(sqrt(nrow(Rabbit)))
Rabbit_pred <- knn(train = Rabbit.training, test = Rabbit.test, cl = Rabbit.trainLabels, k=kv)
Rabbit_pred
CrossTable(x = Rabbit.testLabels, y = Rabbit_pred, prop.chisq = FALSE)
