#include <iostream>
#include <array>

using std::cin; using std::cout; using std::endl; using std::array;

int main(int argc, char** argv)
{
    constexpr int n = 40;
    array<array<int, n>, n> magic{};
    array<int, n * n> morse{};

    int size = n * n;

    for (int i = 0; i < size; ++i)
    {
        morse[i] = __builtin_popcount(i) % 2 == 0;
    }

    for (int i = 0; i < n; ++i)
    {
        for (int j = 0; j < n; ++j)
        {
            magic[i][j] = morse[i * n + j] * (i * n + j + 1) + !morse[i * n + j] * (n * n - (i * n + j));
        }
    }

    int sum = 0;
    for (int i = 0; i < n; ++i)
    {
        for (int j = 0; j < n; ++j)
        {
            cout << magic[i][j] << '\t';
            sum += magic[i][j];
        }
        cout << "\t\t" << sum << '\n';
        sum = 0;
    }

    return 0;
}
