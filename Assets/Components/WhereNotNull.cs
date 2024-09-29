#nullable enable
using System.Collections.Generic;

namespace Components
{
    public static class WhereNotNullExtension
    {
        public static IEnumerable<T> WhereNotNull<T>(this IEnumerable<T?> source) where T : class
        {
            foreach (var item in source)
            {
                if (item is not null) yield return item;
            }
        }

        public static IEnumerable<T> WhereNotNull<T>(this IEnumerable<T?> source) where T : struct
        {
            foreach (var item in source)
            {
                if (item is not null) yield return item.Value;
            }
        }
    }
}