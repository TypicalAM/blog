---
title: "Working with generics in Go"
summary: "While generics are said to be a tool for library-makers, learning about how they work can help to solve some tricky problems in a much more general manner."
tags: ["golang","generics"]
#externalUrl: ""
#showSummary: true
date: 2023-05-18
draft: false
---

## Intro

Welcome to the world of generics in Go! Generics provide a powerful toolset that allows developers to write reusable and type-safe code, enabling increased flexibility and efficiency in Go programming. With the introduction of generics in Go 1.18, the language has embraced a new era of expressiveness and versatility. In this guide, we will explore the fundamentals of working with generics in Go, learn how to define generic functions, types, and interfaces, and discover practical use cases where generics shine. We will explore linear searching using generics.

## Why do generics?

There has been a moment for me when I was told that I was probably never going to use generics in my daily life and that their existence is more important for creating libraries. But sometimes good uses for generics just appear in plain sight and they are not that difficult! Let us jump to a problem shall we?

### Linear searching

Linear search is a very common problem in basically every application. Let's say for example that we are in a snail race and we need to find which place our snail achieved - to do that we need to define a function which looks for a string in a slice of strings:

```go
func getIndexOfStr(slice []string, str string) int {
	for index, value := range slice {
		if value == str {
			return index
		}
	}
	return -1
}
```

We can use it like that:

```go 
func main() {
	snailRanking := []string{
		"Shelby", "Shelly", "Sheldon",
		"Shels", "Slider", "Slimer",
		"Slim", "Gary",
	}

	snailPlace := getIndexOfStr(snailRanking, "Gary")
	msg := fmt.Sprintf("My snail Gary finished at the %d place", snailPlace)
	fmt.Println(msg)
}
```

Now we find that our snail "Gary" was at the last place (which is unfortunate). What if (because of data protection or other things) the names of the Snails were not exposed, only their `contender ID`s, if we knew that gary has an `ID` of `10`, we could find him using another function.

```go
func getIndexOfInt(slice []int, num int) int {
	for index, value := range slice {
		if value == num {
			return index
		}
	}

	return -1
}
```

```go
func main() {
	snailRankingInts := []int{8, 6, 1, 4, 2, 7, 9, 3, 5, 15, 34}
	snailPlaceInt := getIndexOfInt(snailRankingInts, 10)
	msgInt := fmt.Sprintf("My snail Gary finished at the %d place", snailPlaceInt)
	fmt.Println(msgInt)
}
```

But what about if the slice was made of `Snail` objects!? As you can probably see there are a lot of things we can apply this operation to and we don't really want to write more code everytime we have a new set of data.

### Linear searching with generics

Generics allow us to make this function much more, well, *generic* - instead of using two functions each with a concrete type of `int` or `string` we can create a generic function which will take an `int` *or* a `string` instance. Let's see it in action:

```go
func getIndex[T int | string](slice []T, val T) int {
	for index, value := range slice {
		if value == val {
			return index
		}
	}
	return -1
}
```

And we can call it normally on both types:

```go
func main() {
	snailRanking := []string{
		"Shelby", "Shelly", "Sheldon",
		"Shels", "Slider", "Slimer",
		"Slim", "Gary",
	}
	snailRankingInts := []int{8, 6, 1, 4, 2, 7, 9, 3, 5}

	snailPlace := getIndex(snailRanking, "Gary")
	msg := fmt.Sprintf("My snail Gary finished at the %d place", snailPlace)
	fmt.Println(msg)

	snailPlaceInt := getIndex(snailRankingInts, 9)
	msgInt := fmt.Sprintf("My snail Gary finished at the %d place", snailPlaceInt)
	fmt.Println(msgInt)
}
```

Here we introduce a type of `T` which represents an `int` *or* a `string`. The go compiler generates concrete definitions for each of the variants of the function at compile-time.

### More generic

If we can make this function accept `int` or `string` we can also make it more generic by accepting a type `any`, but not every type allow for comparison using `==`. Comparable types are booleans, numbers, strings, pointers, channels, arrays of comparable types and structs whose fields are all comparable types. To make sure the elements are comparable just edit the function to include the `comparable` constraint:

```go
func getIndex[T comparable](slice []T, val T) int {
	for index, value := range slice {
		if value == val {
			return index
		}
	}
	return -1
}
```

Now we can even introduce the `Snail` struct and use the function to even compare values of `Snail`s:

```go
type Snail struct {
	name  string
	slimy bool
}
```

Below is the full code:

```go
package main

import "fmt"

type Snail struct {
	name  string
	slimy bool
}

func getIndex[T comparable](slice []T, val T) int {
	for index, value := range slice {
		if value == val {
			return index
		}
	}
	return -1
}

func main() {
	snailRanking := []Snail{
		{"Shelby", true}, {"Shelly", true}, {"Sheldon", true},
		{"Shels", true}, {"Slider", true}, {"Slimer", true},
		{"Gary", true}, {"Squishy", true},
	}

	snailPlace := getIndex(snailRanking, Snail{"Gary", true})
	msg := fmt.Sprintf("My snail Gary finished at the %d place", snailPlace)
	fmt.Println(msg)
}
```

Now that you're equipped with basic the knowledge of generics in Go, go forth and explore their vast potential. Continue to deepen your understanding by exploring advanced topics such as generic interfaces, type constraints, and more. Embrace the opportunities that generics offer in building scalable, efficient, and robust applications.

Happy coding, and may your journeys with generics in Go be filled with creativity, innovation, and success! 
