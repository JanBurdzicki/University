// Jan Burdzicki
// List: 2
// Task: 1, 2, 3, 4
// dotnet version >= 7.0
using System;
using System.Collections.Generic;
using System.Text;

public class IntStream {
    protected int current;
    public IntStream() { current = 0; }
    public virtual int Next() {
        if(Eos()) throw new InvalidOperationException("End of stream reached");
        return current++;
    }
    public virtual bool Eos() => current >= int.MaxValue;
    public virtual void Reset() => current = 0;
}

public class FibStream : IntStream {
    private int prev;
    public FibStream() { Reset(); }
    public override int Next() {
        if(Eos()) throw new InvalidOperationException("End of Fibonacci sequence");
        int temp = current;
        current += prev;
        prev = temp;
        return temp;
    }
    public override bool Eos() => current < 0;
    public override void Reset() { current = 1; prev = 0; }
}

public class RandomStream : IntStream {
    private Random rand = new Random();
    public override int Next() => rand.Next();
    public override bool Eos() => false;
}

public class RandomWordStream {
    private FibStream fibStream = new FibStream();
    private RandomStream randStream = new RandomStream();
    public string Next() {
        int length = fibStream.Next();
        // faster than using string concatenation
        // string result = "";
        // result += (char)('a' + randStream.Next() % 26);
        StringBuilder sb = new StringBuilder(length);
        for(int i = 0; i < length; i++) {
            sb.Append((char)('a' + randStream.Next() % 26));
        }
        return sb.ToString();
    }
}

// public class Array_Dict {
//     private Dictionary<int, int> data;
//     private int lowerBound, upperBound;
//     public Array(int lower, int size) {
//         lowerBound = lower;
//         upperBound = lower + size - 1;
//         data = new Dictionary<int, int>();
//     }
//     public void Set(int index, int value) {
//         if(index < lowerBound || index > upperBound) throw new IndexOutOfRangeException();
//         data[index] = value;
//     }
//     public int Get(int index) {
//         if(index < lowerBound || index > upperBound) throw new IndexOutOfRangeException();
//         return data.ContainsKey(index) ? data[index] : 0;
//     }
// }

public class Array {
    private LinkedList<int> data;
    private int lowerBound;
    public Array(int lower, int size) {
        lowerBound = lower;
        data = new LinkedList<int>(new int[size]);
    }
    public void Set(int index, int value) {
        if(index < lowerBound || index >= lowerBound + data.Count) throw new IndexOutOfRangeException();
        var node = GetNodeAt(index - lowerBound);
        node.Value = value;
    }
    public int Get(int index) {
        if(index < lowerBound || index >= lowerBound + data.Count) throw new IndexOutOfRangeException();
        return GetNodeAt(index - lowerBound).Value;
    }
    private LinkedListNode<int> GetNodeAt(int position) {
        var node = data.First;
        for(int i = 0; i < position; i++) node = node.Next;
        return node;
    }
    public void Resize(int newSize) {
        int currentSize = data.Count;
        if(newSize > currentSize) {
            for(int i = 0; i < newSize - currentSize; i++) {
                data.AddLast(0);
            }
        }
        else {
            for(int i = 0; i < currentSize - newSize; i++) {
                data.RemoveLast();
            }
        }
    }
}


public class LazyIntList {
    protected List<int> numbers = new List<int>();
    public virtual int Element(int i) {
        while(numbers.Count <= i) {
            numbers.Add(numbers.Count);
        }
        return numbers[i];
    }
    public int Size() => numbers.Count;
}

public class LazyPrimeList : LazyIntList {
    private bool IsPrime(int num) {
        if(num < 2) return false;
        for(int i = 2; i * i <= num; i++) {
            if(num % i == 0) return false;
        }
        return true;
    }
    public override int Element(int i) {
        int num = numbers.Count > 0 ? numbers[^1] + 1 : 2;
        while(numbers.Count <= i) {
            while(!IsPrime(num)) num++;
            numbers.Add(num++);
        }
        return numbers[i];
    }
}

public class FibonacciWords {
    private string prev, current;
    public FibonacciWords(string first = "a", string second = "b") { prev = first; current = second; }
    public string Next() {
        string temp = current;
        current += prev;
        prev = temp;
        return current;
    }
}

public class FibonacciWordList {
    private List<string> words = new List<string>();
    public FibonacciWordList(string first = "a", string second = "b") {
        words.Add(first);
        words.Add(second);
    }
    public string Word(int i) {
        while(words.Count <= i)
            words.Add(words[^1] + words[^2]);
        return words[i];
    }
}

public class Program {
    public static void DemonstrateIntStream(int count) {
        IntStream intStream = new IntStream();
        for(int i = 0; i < count; i++) {
            Console.WriteLine(intStream.Next());
        }
    }

    public static void DemonstrateFibStream(int count) {
        FibStream fibStream = new FibStream();
        for(int i = 0; i < count; i++) {
            Console.WriteLine(fibStream.Next());
        }
    }

    public static void DemonstrateRandomStream(int count) {
        RandomStream randomStream = new RandomStream();
        for(int i = 0; i < count; i++) {
            Console.WriteLine(randomStream.Next());
        }
    }

    public static void DemonstrateRandomWordStream(int count) {
        RandomWordStream randomWordStream = new RandomWordStream();
        for(int i = 0; i < count; i++) {
            Console.WriteLine(randomWordStream.Next());
        }
    }

    public static void DemonstrateLazyIntList(int count) {
        LazyIntList lazyIntList = new LazyIntList();
        for(int i = 0; i < count; i++) {
            Console.WriteLine(lazyIntList.Element(i));
        }
    }

    public static void DemonstrateLazyPrimeList(int count) {
        LazyPrimeList lazyPrimeList = new LazyPrimeList();
        for(int i = 0; i < count; i++) {
            Console.WriteLine(lazyPrimeList.Element(i));
        }
    }

    public static void DemonstrateFibonacciWords(int count) {
        FibonacciWords fibonacciWords = new FibonacciWords();
        for(int i = 0; i < count; i++) {
            Console.WriteLine(fibonacciWords.Next());
        }
    }

    public static void DemonstrateFibonacciWordList(int count) {
        FibonacciWordList fibonacciWordList = new FibonacciWordList();
        for(int i = 0; i < count; i++) {
            Console.WriteLine(fibonacciWordList.Word(i));
        }
    }

    public static void DemonstrateArray(int lower, int size) {
        Array array = new Array(lower, size);
        for(int i = 0; i < size; i++) {
            array.Set(i, i);
        }
        for(int i = 0; i < size; i++) {
            Console.WriteLine(array.Get(i));
        }
    }

    public static void Main() {
        Console.WriteLine("IntStream demonstration:");
        DemonstrateIntStream(5);

        Console.WriteLine("\nFibStream demonstration:");
        DemonstrateFibStream(5);

        Console.WriteLine("\nRandomWordStream demonstration:");
        DemonstrateRandomWordStream(5);

        Console.WriteLine("\nLazyPrimeList demonstration:");
        DemonstrateLazyPrimeList(5);

        Console.WriteLine("\nFibonacciWords demonstration:");
        DemonstrateFibonacciWords(5);

        Console.WriteLine("\nFibonacciWordList demonstration:");
        DemonstrateFibonacciWordList(5);

        Console.WriteLine("\nArray demonstration:");
        DemonstrateArray(0, 5);

        Console.WriteLine("\nLazyIntList demonstration:");
        DemonstrateLazyIntList(5);

        Console.WriteLine("\nLazyPrimeList demonstration:");
        DemonstrateLazyPrimeList(5);
    }
}
